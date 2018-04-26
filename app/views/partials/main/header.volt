<div class="container relative">
	<a id="logo" href="{{ helper.currentUrl(constant('LANG')) }}">
	    <img src="/{{ helper.logo() }}" width="140">
	</a>	

	{% set languages = helper.languages() %}
	{% if languages|length > 1 %}
			<div class="languages">
	    	<div id="curLang"><span class="title"></span> <span class="caret"></span></div>
	    	<ul class="language-switcher">
	        {% for language in languages %}
	            <li>
	                {{ helper.langSwitcher(language['iso'], language['name']) }}
	            </li>
	        {% endfor %}
	        </ul>
	    </div>
	{% endif %}	

	{{ helper.widget('Search').search() }}

	{{ partial('main/menu') }}

	

</div>