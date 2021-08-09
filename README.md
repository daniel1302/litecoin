# litecoin

## Testing

### 1. Docker image

#### Build the image:

Run the image and verify output.

```bash
docker build -t daniel1302/litecoin:latest . ;
docker run daniel1302/litecoin:latest;
```

#### Security scan for images

```bash
# Login to dockerhub
docker login;

# DockerHub
docker push daniel1302/litecoin:latest;
docker scan daniel1302/litecoin:latest;

# Anchore
# Ref: https://engine.anchore.io/docs/quickstart/
cd anchore;
docker-compose up -d;

# Add image to anchore
docker-compose exec api anchore-cli image add daniel1302/litecoin:latest;
# Wait until image is analyzed
docker-compose exec api anchore-cli image wait daniel1302/litecoin:latest;
# List packages
docker-compose exec api anchore-cli evaluate check daniel1302/litecoin:latest
# List all vulns
docker-compose exec api anchore-cli image vuln daniel1302/litecoin:latest all;
# Check pass
docker-compose exec api anchore-cli evaluate check daniel1302/litecoin:latest
```

##### Output

```
docker-compose exec api anchore-cli evaluate check daniel1302/litecoin:latest    

Image Digest: sha256:599234e210342cc2655a593f109cbc4e9d1a8242267e6c87374c2c38cdbb00b6
Full Tag: docker.io/daniel1302/litecoin:latest
Status: pass
Last Eval: 2021-08-08T14:31:30Z
Policy ID: 2c53a13c-1765-11e8-82ef-23527761d060
```

```
docker-compose exec api anchore-cli image content daniel1302/litecoin:latest os; 


Package                       Version                             Licenses                                                                                                                                                                                                                                                                                                                        
adduser                       3.118                               Unknown                                                                                                                                                                                                                                                                                                                         
apt                           2.2.4                               GPLv2+                                                                                                                                                                                                                                                                                                                          
base-files                    11.1                                Unknown                                                                                                                                                                                                                                                                                                                         
base-passwd                   3.5.51                              GPL-2 public-domain                                                                                                                                                                                                                                                                                                             
bash                          5.1-2+b3                            Unknown                                                                                                                                                                                                                                                                                                                         
bsdutils                      1:2.36.1-8                          BSD-2-clause BSD-3-clause BSD-4-clause GPL-2 GPL-2+ GPL-3+ LGPL LGPL-2+ LGPL-2.1+ LGPL-3+ MIT public-domain                                                                                                                                                                                                                     
coreutils                     8.32-4+b1                           Unknown                                                                                                                                                                                                                                                                                                                         
dash                          0.5.11+git20200708+dd9ef66-5        BSD-3-Clause BSD-3-clause Expat FSFUL FSFULLR GPL-2+ public-domain                                                                                                                                                                                                                                                              
debconf                       1.5.77                              BSD-2-clause                                                                                                                                                                                                                                                                                                                    
debian-archive-keyring        2021.1.1                            Unknown                                                                                                                                                                                                                                                                                                                         
debianutils                   4.11.2                              Unknown                                                                                                                                                                                                                                                                                                                         
diffutils                     1:3.7-5                             Unknown                                                                                                                                                                                                                                                                                                                         
dpkg                          1.20.9                              BSD-2-clause GPL-2 GPL-2+ public-domain-md5 public-domain-s-s-d                                                                                                                                                                                                                                                                 
e2fsprogs                     1.46.2-2                            Unknown                                                                                                                                                                                                                                                                                                                         
findutils                     4.8.0-1                             Unknown                                                                                                                                                                                                                                                                                                                         
gcc-10-base                   10.2.1-6                            Unknown                                                                                                                                                                                                                                                                                                                         
gcc-9-base                    9.3.0-22                            LGPL-2.1+                                                                                                                                                                                                                                                                                                                       
gpgv                          2.2.27-2                            BSD-3-clause CC0-1.0 Expat GPL-3+ LGPL-2.1+ LGPL-3+ RFC-Reference TinySCHEME permissive                                                                                                                                                                                                                                         
grep                          3.6-1                               GPL-3+                                                                                                                                                                                                                                                                                                                          
gzip                          1.10-4                              FSF-manpages GFDL-1.3+-no-invariant GPL-3+                                                                                                                                                                                                                                                                                      
hostname                      3.23                                Unknown                                                                                                                                                                                                                                                                                                                         
init-system-helpers           1.60                                BSD-3-clause GPL-2+                                                                                                                                                                                                                                                                                                             
libacl1                       2.2.53-10                           GPL-2+ LGPL-2+                                                                                                                                                                                                                                                                                                                  
libapt-pkg6.0                 2.2.4                               GPLv2+                                                                                                                                                                                                                                                                                                                          
libattr1                      1:2.4.48-6                          GPL-2+ LGPL-2+                                                                                                                                                                                                                                                                                                                  
libaudit-common               1:3.0-2                             GPL-2 LGPL-2.1                                                                                                                                                                                                                                                                                                                  
libaudit1                     1:3.0-2                             GPL-2 LGPL-2.1                                                                                                                                                                                                                                                                                                                  
libblkid1                     2.36.1-8                            BSD-2-clause BSD-3-clause BSD-4-clause GPL-2 GPL-2+ GPL-3+ LGPL LGPL-2+ LGPL-2.1+ LGPL-3+ MIT public-domain                                                                                                                                                                                                                     
libbz2-1.0                    1.0.8-4                             BSD-variant GPL-2                                                                                                                                                                                                                                                                                                               
libc-bin                      2.31-13                             Unknown                                                                                                                                                                                                                                                                                                                         
libc6                         2.31-13                             Unknown                                                                                                                                                                                                                                                                                                                         
libcap-ng0                    0.7.9-2.2+b1                        Unknown                                                                                                                                                                                                                                                                                                                         
libcom-err2                   1.46.2-2                            Unknown                                                                                                                                                                                                                                                                                                                         
libcrypt1                     1:4.4.18-4                          Unknown                                                                                                                                                                                                                                                                                                                         
libdb5.3                      5.3.28+dfsg1-0.8                    Unknown                                                                                                                                                                                                                                                                                                                         
libdebconfclient0             0.260                               Unknown                                                                                                                                                                                                                                                                                                                         
libext2fs2                    1.46.2-2                            Unknown                                                                                                                                                                                                                                                                                                                         
libffi7                       3.3-6                               Unknown                                                                                                                                                                                                                                                                                                                         
libgcc-s1                     10.2.1-6                            Unknown                                                                                                                                                                                                                                                                                                                         
libgcrypt20                   1.8.7-6                             Unknown                                                                                                                                                                                                                                                                                                                         
libgmp10                      2:6.2.1+dfsg-1                      Unknown                                                                                                                                                                                                                                                                                                                         
libgnutls30                   3.7.1-5                             Apache-2.0 BSD-3-Clause CC0 Expat GPLv3+ LGPLv2.1+ LGPLv3+_or_GPLv2+ The                                                                                                                                                                                                                                                        
libgpg-error0                 1.38-2                              BSD-3-clause GPL-3+ LGPL-2.1+ g10-permissive                                                                                                                                                                                                                                                                                    
libgssapi-krb5-2              1.18.3-6                            Unknown                                                                                                                                                                                                                                                                                                                         
libhogweed6                   3.7.3-1                             Expat GAP GPL-2 GPL-2+ GPL-3+ LGPL-2+ LGPL-3+ public-domain                                                                                                                                                                                                                                                                     
libidn2-0                     2.3.0-5                             GPL-2+ GPL-3+ LGPL-3+ Unicode                                                                                                                                                                                                                                                                                                   
libk5crypto3                  1.18.3-6                            Unknown                                                                                                                                                                                                                                                                                                                         
libkeyutils1                  1.6.1-2                             GPL-2+ LGPL-2+                                                                                                                                                                                                                                                                                                                  
libkrb5-3                     1.18.3-6                            Unknown                                                                                                                                                                                                                                                                                                                         
libkrb5support0               1.18.3-6                            Unknown                                                                                                                                                                                                                                                                                                                         
liblz4-1                      1.9.3-2                             BSD-2-clause GPL-2 GPL-2+                                                                                                                                                                                                                                                                                                       
liblzma5                      5.2.5-2                             Autoconf GPL-2 GPL-2+ LGPL-2.1+ PD PD-debian config-h noderivs permissive-fsf permissive-nowarranty probably-PD                                                                                                                                                                                                                 
libmount1                     2.36.1-8                            BSD-2-clause BSD-3-clause BSD-4-clause GPL-2 GPL-2+ GPL-3+ LGPL LGPL-2+ LGPL-2.1+ LGPL-3+ MIT public-domain                                                                                                                                                                                                                     
libnettle8                    3.7.3-1                             Expat GAP GPL-2 GPL-2+ GPL-3+ LGPL-2+ LGPL-3+ public-domain                                                                                                                                                                                                                                                                     
libnsl2                       1.3.0-2                             BSD-3-clause GPL-2+-autoconf-exception GPL-2+-libtool-exception GPL-3+-autoconf-exception LGPL-2.1 LGPL-2.1+ MIT permissive-autoconf-m4 permissive-autoconf-m4-no-warranty permissive-configure permissive-fsf permissive-makefile-in                                                                                           
libp11-kit0                   0.23.22-1                           BSD-3-Clause ISC ISC+IBM permissive-like-automake-output same-as-rest-of-p11kit                                                                                                                                                                                                                                                 
libpam-modules                1.4.0-9                             Unknown                                                                                                                                                                                                                                                                                                                         
libpam-modules-bin            1.4.0-9                             Unknown                                                                                                                                                                                                                                                                                                                         
libpam-runtime                1.4.0-9                             Unknown                                                                                                                                                                                                                                                                                                                         
libpam0g                      1.4.0-9                             Unknown                                                                                                                                                                                                                                                                                                                         
libpcre2-8-0                  10.36-2                             Unknown                                                                                                                                                                                                                                                                                                                         
libpcre3                      2:8.39-13                           Unknown                                                                                                                                                                                                                                                                                                                         
libseccomp2                   2.5.1-1                             LGPL-2.1                                                                                                                                                                                                                                                                                                                        
libselinux1                   3.1-3                               Unknown                                                                                                                                                                                                                                                                                                                         
libsemanage-common            3.1-1                               Unknown                                                                                                                                                                                                                                                                                                                         
libsemanage1                  3.1-1+b2                            Unknown                                                                                                                                                                                                                                                                                                                         
libsepol1                     3.1-1                               Unknown                                                                                                                                                                                                                                                                                                                         
libsmartcols1                 2.36.1-8                            BSD-2-clause BSD-3-clause BSD-4-clause GPL-2 GPL-2+ GPL-3+ LGPL LGPL-2+ LGPL-2.1+ LGPL-3+ MIT public-domain                                                                                                                                                                                                                     
libss2                        1.46.2-2                            Unknown                                                                                                                                                                                                                                                                                                                         
libssl1.1                     1.1.1k-1                            Unknown                                                                                                                                                                                                                                                                                                                         
libstdc++6                    10.2.1-6                            Unknown                                                                                                                                                                                                                                                                                                                         
libsystemd0                   247.3-6                             CC0-1.0 Expat GPL-2 GPL-2+ LGPL-2.1+ public-domain                                                                                                                                                                                                                                                                              
libtasn1-6                    4.16.0-2                            Unknown                                                                                                                                                                                                                                                                                                                         
libtinfo6                     6.2+20201114-2                      BSD-3-clause MIT/X11 X11                                                                                                                                                                                                                                                                                                        
libtirpc-common               1.3.1-1                             BSD-3-Clause GPL-2                                                                                                                                                                                                                                                                                                              
libtirpc3                     1.3.1-1                             BSD-3-Clause GPL-2                                                                                                                                                                                                                                                                                                              
libudev1                      247.3-6                             CC0-1.0 Expat GPL-2 GPL-2+ LGPL-2.1+ public-domain                                                                                                                                                                                                                                                                              
libunistring2                 0.9.10-4                            FreeSoftware GFDL-1.2+ GPL-2+ GPL-3+ LGPL-3+ MIT                                                                                                                                                                                                                                                                                
libuuid1                      2.36.1-8                            BSD-2-clause BSD-3-clause BSD-4-clause GPL-2 GPL-2+ GPL-3+ LGPL LGPL-2+ LGPL-2.1+ LGPL-3+ MIT public-domain                                                                                                                                                                                                                     
libxxhash0                    0.8.0-2                             BSD-2-clause GPL-2                                                                                                                                                                                                                                                                                                              
libzstd1                      1.4.8+dfsg-2.1                      BSD-3-clause Expat GPL-2 zlib                                                                                                                                                                                                                                                                                                   
login                         1:4.8.1-1                           Unknown                                                                                                                                                                                                                                                                                                                         
logsave                       1.46.2-2                            Unknown                                                                                                                                                                                                                                                                                                                         
lsb-base                      11.1.0                              BSD-3-clause GPL-2                                                                                                                                                                                                                                                                                                              
mawk                          1.3.4.20200120-2                    Unknown                                                                                                                                                                                                                                                                                                                         
mount                         2.36.1-8                            BSD-2-clause BSD-3-clause BSD-4-clause GPL-2 GPL-2+ GPL-3+ LGPL LGPL-2+ LGPL-2.1+ LGPL-3+ MIT public-domain                                                                                                                                                                                                                     
ncurses-base                  6.2+20201114-2                      BSD-3-clause MIT/X11 X11                                                                                                                                                                                                                                                                                                        
ncurses-bin                   6.2+20201114-2                      BSD-3-clause MIT/X11 X11                                                                                                                                                                                                                                                                                                        
passwd                        1:4.8.1-1                           Unknown                                                                                                                                                                                                                                                                                                                         
perl-base                     5.32.1-4                            Artistic Artistic-2 Artistic-dist BSD-3-clause BSD-3-clause-GENERIC BSD-3-clause-with-weird-numbering BSD-4-clause-POWERDOG BZIP DONT-CHANGE-THE-GPL Expat GPL-1+ GPL-2+ GPL-3+-WITH-BISON-EXCEPTION HSIEH-BSD HSIEH-DERIVATIVE LGPL-2.1 REGCOMP REGCOMP, RRA-KEEP-THIS-NOTICE SDBM-PUBLIC-DOMAIN TEXT-TABS Unicode ZLIB        
sed                           4.7-1                               Unknown                                                                                                                                                                                                                                                                                                                         
sysvinit-utils                2.96-7                              GPL-2+                                                                                                                                                                                                                                                                                                                          
tar                           1.34+dfsg-1                         Unknown                                                                                                                                                                                                                                                                                                                         
tzdata                        2021a-1                             Unknown                                                                                                                                                                                                                                                                                                                         
util-linux                    2.36.1-8                            BSD-2-clause BSD-3-clause BSD-4-clause GPL-2 GPL-2+ GPL-3+ LGPL LGPL-2+ LGPL-2.1+ LGPL-3+ MIT public-domain                                                                                                                                                                                                                     
zlib1g                        1:1.2.11.dfsg-2                     Zlib
```



### 2. Kubernetes

Template copied from: `https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/`.I have just adjusted it.

#### Starting app in k8s

```
kubectl apply -f k8s.yaml
```

#### Some outputs

```
➜  littlecoin git:(master) ✗ minikube version
minikube version: v1.16.0
commit: 9f1e482427589ff8451c4723b6ba53bb9742fbb1
➜  littlecoin git:(master) ✗ kubectl get statefulset
NAME       READY   AGE
litecoin   1/1     3m15s
➜  littlecoin git:(master) ✗ kubectl get pvc        
NAME                  STATUS   VOLUME                                     CAPACITY   ACCESS MODES   STORAGECLASS   AGE
litecoin-litecoin-0   Bound    pvc-1327c67f-729e-4f10-a330-443ade3fca5e   1Gi        RWO            standard       3m19s
pg-data-claim         Bound    pvc-315d347a-be11-49d8-87f2-690ed76b70e2   500Mi      RWO            standard       223d
➜  littlecoin git:(master) ✗ kubectl get storageclass
NAME                 PROVISIONER                RECLAIMPOLICY   VOLUMEBINDINGMODE   ALLOWVOLUMEEXPANSION   AGE
standard (default)   k8s.io/minikube-hostpath   Delete          Immediate           false                  223d
```

```
git:(master) ✗ kubectl describe pod  litecoin-0 
Name:         litecoin-0
Namespace:    default
Priority:     0
Node:         minikube/192.168.65.2
Start Time:   Sun, 08 Aug 2021 18:02:04 +0200
Labels:       app=litecoin
              controller-revision-hash=litecoin-6dfd95f446
              statefulset.kubernetes.io/pod-name=litecoin-0
Annotations:  <none>
Status:       Running
IP:           172.17.0.2
IPs:
  IP:           172.17.0.2
Controlled By:  StatefulSet/litecoin
Containers:
  litecoin:
    Container ID:   docker://7cac956b8132881457876fa4773e9b5e122d3cea8cf75fe1c73d5727012fb09a
    Image:          daniel1302/litecoin:latest
    Image ID:       docker-pullable://daniel1302/litecoin@sha256:599234e210342cc2655a593f109cbc4e9d1a8242267e6c87374c2c38cdbb00b6
    Ports:          9332/TCP, 9333/TCP
    Host Ports:     0/TCP, 0/TCP
    State:          Running
      Started:      Sun, 08 Aug 2021 18:02:08 +0200
    Ready:          True
    Restart Count:  0
    Limits:
      cpu:     1
      memory:  1Gi
    Requests:
      cpu:        1
      memory:     1Gi
    Environment:  <none>
    Mounts:
      /home/litecoin/.litecoind from litecoin (rw)
      /var/run/secrets/kubernetes.io/serviceaccount from default-token-5tncv (ro)
Conditions:
  Type              Status
  Initialized       True 
  Ready             True 
  ContainersReady   True 
  PodScheduled      True 
Volumes:
  litecoin:
    Type:       PersistentVolumeClaim (a reference to a PersistentVolumeClaim in the same namespace)
    ClaimName:  litecoin-litecoin-0
    ReadOnly:   false
  default-token-5tncv:
    Type:        Secret (a volume populated by a Secret)
    SecretName:  default-token-5tncv
    Optional:    false
QoS Class:       Guaranteed
Node-Selectors:  <none>
Tolerations:     node.kubernetes.io/not-ready:NoExecute for 300s
                 node.kubernetes.io/unreachable:NoExecute for 300s
Events:
  Type    Reason     Age   From               Message
  ----    ------     ----  ----               -------
  Normal  Scheduled  70s   default-scheduler  Successfully assigned default/litecoin-0 to minikube
  Normal  Pulling    69s   kubelet, minikube  Pulling image "daniel1302/litecoin:latest"
  Normal  Pulled     66s   kubelet, minikube  Successfully pulled image "daniel1302/litecoin:latest"
  Normal  Created    66s   kubelet, minikube  Created container litecoin
  Normal  Started    66s   kubelet, minikube  Started container litecoin
```


## 3. CI

### Prerequisites

- Particular Jenkins credentials added in the Jenkins CI
- Added webhook in the repository which sends information about repository changes
- Installed `GIT` plugin in Jenkins
- Installed `Pipeline Utility Steps` plugin in Jenkins


### Inline Scan Script

I took it from the anchore github: https://github.com/anchore/ci-tools/blob/master/scripts/inline_scan

### Example output

```
Started by user Daniel Hornik
Replayed #40
ERROR: Could not determine exact tip revision of master; falling back to nondeterministic checkout
Running in Durability level: MAX_SURVIVABILITY
[Pipeline] Start of Pipeline
[Pipeline] node
Running on Jenkins in /var/lib/jenkins/workspace/daniel-test_master
[Pipeline] {
[Pipeline] properties
[Pipeline] stage
[Pipeline] { (Prepare CI)
[Pipeline] git
The recommended git tool is: NONE
No credentials specified
 > git rev-parse --is-inside-work-tree # timeout=10
Fetching changes from the remote Git repository
 > git config remote.origin.url http://github.com/daniel1302/litecoin.git # timeout=10
Fetching upstream changes from http://github.com/daniel1302/litecoin.git
 > git --version # timeout=10
 > git --version # 'git version 2.23.3'
 > git fetch --tags --force --progress -- http://github.com/daniel1302/litecoin.git +refs/heads/*:refs/remotes/origin/* # timeout=10
 > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
Checking out Revision 3d175dc4a68edeb5261a3af01cdac5579d382bd4 (refs/remotes/origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 3d175dc4a68edeb5261a3af01cdac5579d382bd4 # timeout=10
 > git branch -a -v --no-abbrev # timeout=10
 > git branch -D master # timeout=10
 > git checkout -b master 3d175dc4a68edeb5261a3af01cdac5579d382bd4 # timeout=10
Commit message: " #3: Add pipeline script"
[Pipeline] readYaml
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Build docker image)
[Pipeline] timeout
Timeout set to expire in 3 min 0 sec
[Pipeline] {
[Pipeline] ansiColor
[Pipeline] {

[Pipeline] sh
+ docker build -t daniel1302/litecoin:build-44 .
Sending build context to Docker daemon  596.3MB

[WARNING]: Empty continuation line found in:
    RUN useradd -u 6655 litecoin                                                                && mkdir -p /home/litecoin/.litecoind                                                   && chown -R litecoin:litecoin /home/litecoin/.litecoind                                 && apt-get update -y                                                                    && apt-get upgrade -y                                                                   && rm -rf /var/lib/apt/lists/*
[WARNING]: Empty continuation lines will become errors in a future release.
Step 1/16 : ARG VERSION=0.18.1
Step 2/16 : FROM debian:bullseye-slim as downloader
 ---> 99a8ac0037bb
Step 3/16 : ARG ARCH=x86_64
 ---> Using cache
 ---> ae37508c6e72
Step 4/16 : ARG PRIVATE_RSA_SIGNATURE="59CAF0E96F23F53747945FD4FE3348877809386C"
 ---> Using cache
 ---> a421f6609213
Step 5/16 : ARG VERSION
 ---> Using cache
 ---> ab2067fefc80
Step 6/16 : WORKDIR /ltmp
 ---> Using cache
 ---> 0d3c975925ba
Step 7/16 : RUN     apt-get update -y && apt-get install -y                                                     wget gnupg                                                                          && rm -rf /var/lib/apt/lists/*                                                          ;                                                                                                                                                                               FILE_NAME="litecoin-${VERSION}-${ARCH}-linux-gnu.tar.gz";                                                                                                                       gpg --keyserver keyserver.ubuntu.com --recv-keys "0x${PRIVATE_RSA_SIGNATURE}"                                                                                                   && wget -O "${FILE_NAME}.asc"         "https://download.litecoin.org/litecoin-${VERSION}/linux/${FILE_NAME}.asc"                                                                                                  && wget -O "${FILE_NAME}"                                                                   "https://download.litecoin.org/litecoin-${VERSION}/linux/${FILE_NAME}"              && gpg --verify "${FILE_NAME}.asc" "${FILE_NAME}"                                       && tar -xzvf ${FILE_NAME}
 ---> Using cache
 ---> 5be24b9ded3d
Step 8/16 : FROM debian:bullseye-slim
 ---> 99a8ac0037bb
Step 9/16 : ARG VERSION
 ---> Using cache
 ---> 362a21f121f6
Step 10/16 : EXPOSE 9332 9333
 ---> Using cache
 ---> 92ac89b02375
Step 11/16 : COPY --from=downloader /ltmp/litecoin-${VERSION}/bin/ /usr/local/bin
 ---> Using cache
 ---> ff7f9f82e1fc
Step 12/16 : COPY ./docker-entrypoint.sh /docker-entrypoint.sh
 ---> Using cache
 ---> 9222fb6c23a8
Step 13/16 : RUN useradd -u 6655 litecoin                                                                && mkdir -p /home/litecoin/.litecoind                                                   && chown -R litecoin:litecoin /home/litecoin/.litecoind                                 && apt-get update -y                                                                    && apt-get upgrade -y                                                                   && rm -rf /var/lib/apt/lists/*
 ---> Using cache
 ---> bae0a9524b49
Step 14/16 : USER litecoin:litecoin
 ---> Using cache
 ---> df154f319921
Step 15/16 : ENTRYPOINT [ "/docker-entrypoint.sh" ]
 ---> Using cache
 ---> 1f254152bec1
Step 16/16 : CMD [ "litecoind" ]
 ---> Using cache
 ---> 644f505c893a
Successfully built 644f505c893a
Successfully tagged daniel1302/litecoin:build-44
[Pipeline] }

[Pipeline] // ansiColor
[Pipeline] }
[Pipeline] // timeout
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Inspect docker vulns)
[Pipeline] timeout
Timeout set to expire in 10 min
[Pipeline] {
[Pipeline] ansiColor
[Pipeline] {

[Pipeline] sh
+ ./inline_scan scan daniel1302/litecoin:build-44

Pulling docker.io/anchore/inline-scan:v0.10.0
v0.10.0: Pulling from anchore/inline-scan
Digest: sha256:e5fdd64edee8244684ab1cb95e4f102bc471632b2032c4a6f901d2e2d3a75e6c
Status: Image is up to date for anchore/inline-scan:v0.10.0
docker.io/anchore/inline-scan:v0.10.0
Starting Anchore Engine
Starting Postgresql... Postgresql started successfully!
Starting Docker registry... Docker registry started successfully!
Waiting for Anchore Engine to be available.

	Status: not_ready....

Anchore Engine is available!


Preparing daniel1302/litecoin:build-44 for analysis

Getting image source signatures
Copying blob sha256:fcfb660ee9a8ba02f768e37a8df9804851653d3650fb8ef803a4717db048a54e
Copying blob sha256:9603296a0529b14c4fa041191e54599f1041140bfbbf861fe1af582e1ee602b1
Copying blob sha256:8e5c31962ed6fb9881c1239a8ded039d185ed815e5a9005d9cb3248e080bc613
Copying blob sha256:82469494a38e5e826c30cc1c44781868408f2d94006e9d86dce4a1b05adc03a3
Copying config sha256:644f505c893afd30c2eb3ce7d7efa66ac71061a25858561cfce2a0ee549545d4
Writing manifest to image destination
Storing signatures

Image archive loaded into Anchore Engine using tag -- litecoin:build-44
Waiting for analysis to complete...

	Status: not_analyzed.
	Status: analyzing...............................
	Status: analyzed

Analysis completed!


	Policy Evaluation - litecoin:build-44
-----------------------------------------------------------

Image Digest: sha256:bce6e590a630fe2d8d415876e4ccd79ecc8aca832e6ca1a9a7d2779d4a6f7aed
Full Tag: localhost:5000/litecoin:build-44
Image ID: 644f505c893afd30c2eb3ce7d7efa66ac71061a25858561cfce2a0ee549545d4
Status: pass
Last Eval: 2021-08-08T20:41:24Z
Policy ID: 2c53a13c-1765-11e8-82ef-23527761d060
Final Action: warn
Final Action Reason: policy_evaluation

Gate                   Trigger            Detail                                                                                                                                                Status        
dockerfile             instruction        Dockerfile directive 'HEALTHCHECK' not found, matching condition 'not_exists' check                                                                   warn          
vulnerabilities        package            MEDIUM Vulnerability found in os package type (dpkg) - libgnutls30 (CVE-2011-3389 - https://security-tracker.debian.org/tracker/CVE-2011-3389)        warn          


Cleaning up docker container: 9104-inline-anchore-engine
[Pipeline] }

[Pipeline] // ansiColor
[Pipeline] }
[Pipeline] // timeout
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Publish docke rimage)
[Pipeline] sh
+ docker pull daniel1302/litecoin:null
[Pipeline] error
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
[Pipeline] // node
[Pipeline] End of Pipeline
ERROR: Image already exists. Bump the version in the config.yml to publish the new one
Finished: FAILURE
```


## 4. Text manipulation

#### Problem

Let's assume We have our application behind the Nginx front proxy. We collected logs from the Nginx server, and We want to know:

- List of ten the most common `remote ip` address. 

The informations should come with corresponding numbers.

Logs are available under address: https://raw.githubusercontent.com/elastic/examples/master/Common%20Data%20Formats/nginx_json_logs/nginx_json_logs


#### Solutions:

References:
- https://www.baeldung.com/linux/reverse-order-of-file-lines
- https://www.gnu.org/software/gawk/manual/html_node/Functions.html


```bash

jq -r '.remote_ip' nginx_json_logs \
    | awk '{seen[$1] += 1 } END { for (ip in seen) print ip, seen[ip] }' \
    | sort -g -k 2n \
    | tac \
    | head -n 10 \
    | awk '{ print "IP: "$1", Visits: "$2 }'
```

#### Result 

```
IP: 216.46.173.126, Visits: 2350
IP: 180.179.174.219, Visits: 1720
IP: 204.77.168.241, Visits: 1439
IP: 65.39.197.164, Visits: 1365
IP: 80.91.33.133, Visits: 1202
IP: 84.208.15.12, Visits: 1120
IP: 74.125.60.158, Visits: 1084
IP: 119.252.76.162, Visits: 1064
IP: 79.136.114.202, Visits: 628
IP: 54.207.57.55, Visits: 532
```

## 5. Text manipulation in programming language

#### Solution

```bash

cd task_5_solution;
go mod vendor;
go build -o task_5_solution cmd/main.go;
./task_5_solution/task_5_solution ./nginx_json_logs 
```

#### Results

```
IP: 216.46.173.126, Visits: 2350
IP: 180.179.174.219, Visits: 1720
IP: 204.77.168.241, Visits: 1439
IP: 65.39.197.164, Visits: 1365
IP: 80.91.33.133, Visits: 1202
IP: 84.208.15.12, Visits: 1120
IP: 74.125.60.158, Visits: 1084
IP: 119.252.76.162, Visits: 1064
IP: 79.136.114.202, Visits: 628
IP: 54.207.57.55, Visits: 532
```