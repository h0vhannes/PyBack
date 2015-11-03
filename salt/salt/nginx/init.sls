nginx:
  pkg:
    - installed
    - skip_verify: True
  service:
    - running
    - enable: True
    - watch:
      - file: /etc/nginx/sites-enabled/*
    - require:
      - pkg: nginx

default-nginx:
  file.absent:
    - name: /etc/nginx/sites-enabled/default
    - require:
      - pkg: nginx

nginxconf:
  file.managed:
    - name: /etc/nginx/sites-enabled/default
    - source: salt://nginx/conf/nginx.conf
    - template: jinja
    - makedirs: True
    - mode: 755

/etc/nginx/sites-available:
  file.directory:
    - user: root
    - mode: 755
    - require:
      - pkg: nginx

/etc/nginx/sites-enabled:
  file.directory:
    - user: root
    - mode: 755
    - require:
      - pkg: nginx