

{% for item in categories %}
  {% set prod_link = helper.langUrl(['for':'products', 'category': item['slug']]) %}  

	{% if item['child']  %}
		<div class="panel panel-default">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordian" href="#{{ item['id'] }}">
						<span class="badge pull-right"><i class="fa fa-plus"></i></span>
						{{ item['title'] }}
					</a>
				</h4>
			</div>

				<div id="{{ item['id'] }}" class="panel-collapse collapse">
					<div class="panel-body">
						<ul>
						 	{% for children in item['child'] %}
		    			{% set child_cat_link = helper.langUrl(['for':'products', 'category': children['slug']]) %}
								<li><a href="{{ child_cat_link }}">{{ children['title'] }}</a> </li>
							{% endfor %}
						</ul>
					</div>
				</div>
		</div>
	{% endif %}

	{% if !item['child'] %}
		<div class="panel panel-default">
			<div class="panel-heading">
				<h4 class="panel-title"><a href="{{ prod_link }}">{{ item['title'] }}</a></h4>
			</div>
		</div>
	{% endif %}
	
{% endfor %}


