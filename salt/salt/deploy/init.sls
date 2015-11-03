migrate:
  cmd.run:
    - name: 'source {{ pillar['project']['venv_dir'] }}/bin/activate && ./manage.py migrate --noinput'
    - cwd: {{ pillar['project']['src_dir'] }}
    - shell: /bin/bash
    - require:
      - virtualenv: {{ pillar['project']['venv_dir'] }}

collectstatic:
  cmd.run:
    - name: 'source {{ pillar['project']['venv_dir'] }}/bin/activate && ./manage.py collectstatic --noinput --link'
    - cwd: {{ pillar['project']['src_dir'] }}
    - shell: /bin/bash
    - require:
      - virtualenv: {{ pillar['project']['venv_dir'] }}