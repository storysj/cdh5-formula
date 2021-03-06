{% if salt['pillar.get']('cdh5:security:enable', False) %}
{%- from 'krb5/settings.sls' import krb5 with context %}
{%- set realm = krb5.realm -%}
create_scm_principal:
  cmd:
    - run
    - name: 'echo "addprinc -pw cloudera cloudera-scm/admin@{{ realm }}" | kadmin -p kadmin/admin -kt /root/admin.keytab -r {{ realm }}'
    - require:
      - module: load_admin_keytab
{% endif %}
