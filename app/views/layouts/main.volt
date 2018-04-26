<header class="header section">
    {{ partial('main/header') }}
</header>

<section class="section">	
	{{content()}}    
</section>

<footer class="footer section">
    {{ partial('main/footer') }}
</footer>

{% if registry.cms['PROFILER'] %}
    {{ helper.dbProfiler() }}
{% endif %}

{{ helper.javascript('body') }}