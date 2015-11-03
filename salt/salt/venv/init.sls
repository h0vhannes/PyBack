{{ pillar['project']['venv_dir'] }}:
  file:
    - directory
    - makedirs: True

  virtualenv:
    - managed
    - distribute: True
    - python: /usr/bin/python3
    - no_chown: True
    - require:
      - pip: virtualenv
      - file: {{ pillar['project']['venv_dir'] }}

install:
  cmd.run:
    - name: 'source {{ pillar['project']['venv_dir'] }}/bin/activate && pip install -r requirements.txt'
    - cwd: {{ pillar['project']['src_dir'] }}
    - shell: /bin/bash
    - require:
      - virtualenv: {{ pillar['project']['venv_dir'] }}