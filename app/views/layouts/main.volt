
{{ partial('main/header') }}

{{content()}}    

<footer id="footer">
    {{ partial('main/footer') }}
</footer>

{% if registry.cms['PROFILER'] %}
    {{ helper.dbProfiler() }}
{% endif %}

{{ helper.javascript('body') }}