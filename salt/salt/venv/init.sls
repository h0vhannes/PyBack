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