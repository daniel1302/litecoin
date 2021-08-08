# Multistage build args
ARG VERSION=0.18.1

FROM debian:bullseye-slim as downloader

# Define some build arguments
ARG ARCH=x86_64
ARG PRIVATE_RSA_SIGNATURE="59CAF0E96F23F53747945FD4FE3348877809386C"
ARG VERSION

# Set the workdir for below layers
WORKDIR /ltmp

# I read about using the `asc` file here, as I do not have gpu commands in my memory
# Ref: https://www.gnupg.org/gph/en/manual/x135.html
RUN \
    # Install some required packages 
    apt-get update -y && apt-get install -y                                             \
        wget gnupg                                                                      \
    && rm -rf /var/lib/apt/lists/*                                                      \
    ;                                                                                   \
                                                                                        \
    FILE_NAME="litecoin-${VERSION}-${ARCH}-linux-gnu.tar.gz";                           \
                                                                                        \
    # Import GPG Key, probably, we can add more servers?
    gpg --keyserver keyserver.ubuntu.com --recv-keys "0x${PRIVATE_RSA_SIGNATURE}"       \
                                                                                        \
    # Download release signature, release archive, and verify it
    && wget -O "${FILE_NAME}.asc" \
        "https://download.litecoin.org/litecoin-${VERSION}/linux/${FILE_NAME}.asc"      \
                                                                                        \
    # Download release file, verify it against checksum and unzip
    && wget -O "${FILE_NAME}"                                                           \
        "https://download.litecoin.org/litecoin-${VERSION}/linux/${FILE_NAME}"          \
    && gpg --verify "${FILE_NAME}.asc" "${FILE_NAME}"                                   \
    && tar -xzvf ${FILE_NAME}



# We can consider to switch to sth smaller like alpine, or scratch, but 
# I like debian-like operating systems
FROM debian:bullseye-slim

ARG VERSION

# Expose ports 
# Ref `litecoind --help`
EXPOSE 9332 9333

# Copy downloaded binaries to bin
COPY --from=downloader /ltmp/litecoin-${VERSION}/bin/ /usr/local/bin

# Copy the entrypoint
COPY ./docker-entrypoint.sh /docker-entrypoint.sh

# Change to non-root user, and create datadir
RUN useradd -u 6655 litecoin                                                            \
    && mkdir -p /home/litecoin/.litecoind                                               \
    && chown -R litecoin:litecoin /home/litecoin/.litecoind                             \

    # Upgrade all packages
    && apt-get update -y                                                                \
    && apt-get upgrade -y                                                               \
    && rm -rf /var/lib/apt/lists/*


USER litecoin:litecoin

ENTRYPOINT [ "/docker-entrypoint.sh" ]
CMD [ "litecoind" ]