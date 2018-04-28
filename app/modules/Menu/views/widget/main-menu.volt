{%- macro leaf_item(leaf, url) %}
  {% set url = helper.currentUrl(constant('LANG')) ~ leaf.getSlug() %}
  {% if leaf.getStatus() == 1 %}  
  <li class="{% if leaf.hasChildren() %}dropdown{% endif %} {{helper.addActiveMenu(url)}}">
    <a href="{{ url }}" >{{ leaf.getTitle() }} {{ helper.activeMenu().activeClass('contacts') }} {% if leaf.hasChildren() %}<i class="fa fa-angle-down"></i>{% endif %}</a>    
    {% if leaf.hasChildren() %}
      <ul role="menu" class="sub-menu">
        {% for child in leaf.children() %}
          {{ leaf_item(child, url) }}
        {% endfor %}
      </ul>
    {% endif %}
  </li>
  {% endif %}
{%- endmacro %}

{% for root, root_title in entries %}        
  {% if root == 'main' %}
  {% set url = helper.currentUrl(constant('LANG')) %}
  <ul class="nav navbar-nav collapse navbar-collapse"> 
    <li class="{{helper.addActiveMenu(url)}}"><a href="{{ url }}">{{helper.at('Home')}}</a></li>           
      {% set menu = menu_helper.menuUpperLeafs(root) %}
      {% for leaf in menu %}
          {{ leaf_item(leaf, url.get()) }}
      {% endfor %}
  </ul>
  {% endif %}
{% endfor %}