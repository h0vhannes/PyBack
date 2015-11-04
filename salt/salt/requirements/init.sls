install:
  cmd.run:
    - name: 'source {{ pillar['project']['venv_dir'] }}/bin/activate && pip install -r requirements.txt'
    - cwd: {{ pillar['project']['src_dir'] }}
    - shell: /bin/bash
    - require:
      - virtualenv: {{ pillar['project']['venv_dir'] }}