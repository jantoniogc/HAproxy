# HAProxy Load Balancer 

This is a [jantoniogc/haproxy](https://hub.docker.com/r/jantoniogc/haproxy/) docker container with HAProxy load balancer. This work is very similar to official [dockerfile/haproxy](https://registry.hub.docker.com/u/dockerfile/haproxy/), but it's based on CentOS-7 and, more importantly, offers ability to provide any arguments to haproxy process. It's also pretty lightweight, only ~240M (vs. ~420M Ubuntu-based dockerfile/haproxy).

This container is built that any extra parameters provided to `docker run` will be passed directly to `haproxy` command. For example, if you run `docker run [run options] jantoniogc/haproxy -n 1000` you pass `-n 1000` to haproxy daemon.

The default [haproxy.cfg](container-files/etc/haproxy/haproxy.cfg) is provided just for demonstration purposes, so of course you will want to override it.

#### Auto restart when config changes
This container comes with inotify to monitor changes in HAProxy config and **reload** HAProxy daemon. The reload is done in a way that no connection is lost.


## ENV variables

**HAPROXY_CONFIG**  
Default: `HAPROXY_CONFIG=/etc/haproxy/haproxy.cfg`  
If you mount your config to different location, simply edit it.


## Usage

### Basic

`docker run -ti -p 80:80 -p 443:443 jantoniogc/haproxy`

### Mount custom config , override some options

`docker run -d -p 80:80 -v /my-haproxy.cfg:/etc/haproxy/haproxy.cfg jantoniogc/haproxy -n 10000`  
Note: in this case config is mounted to its default location, so you don't need to modify `HAPROXY_CONFIG` variable.

### Check version and build options

`docker run -ti jantoniogc/haproxy -vv`

### Stats
The default URL for stats is `http://CONTAINER_IP/admin?stats` with username:password ser to `admin:admin`.

## Authors

Author: Juan Antonio González Cano 

---

