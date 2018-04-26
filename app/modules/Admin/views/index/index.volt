<div class="ui segment">
  <h3>{{helper.at('Contents')}}</h3>
  <ol>
  	<li><a href="{{ url.get() }}page/admin">{{ helper.at('Pages') }}</a></li>
  	<li><a href="{{ url.get() }}publication/admin">{{ helper.at('Publications') }}</a></li>
  	<li><a href="{{ url.get() }}widget/admin">{{ helper.at('Blocks') }}</a></li>
  	<li><a href="{{ url.get() }}slider/admin">{{ helper.at('Slider') }}</a></li>
  	<li><a href="{{ url.get() }}menu/admin">{{ helper.at('Menu') }}</a></li>
  </ol>
</div>

<div class="ui segment">
  <h3>{{helper.at('SEO')}}</h3>
  <ol>
  	<li><a href="{{ url.get() }}seo/robots">Robots.txt</a></li>
  	<li><a href="{{ url.get() }}seo/sitemap">Sitemap.xml</a></li>
  	<li><a href="{{ url.get() }}seo/manager">SEO Manager</a></li>
  </ol>
</div>

<div class="ui segment">
  <h3>{{helper.at('Admin')}}</h3>
  <ol>
  	<li><a href="{{ url.get() }}admin/admin-user">{{ helper.at('Manage Users') }}</a></li>
  	<li><a href="{{ url.get() }}cms/configuration">{{ helper.at('CMS Configuration') }}</a></li>
  	<li><a href="{{ url.get() }}cms/language">{{ helper.at('Languages') }}</a></li>
  	<li><a href="{{ url.get() }}cms/translate">{{ helper.at('Translate') }}</a></li>
  	<li><a href="{{ url.get() }}cms/javascript">{{ '<head>, <body> javascript'|escape }} </a></li>
  </ol>
</div>