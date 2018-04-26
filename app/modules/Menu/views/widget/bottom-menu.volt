{%- macro leaf_item(leaf, url) %}
  {% set url = helper.currentUrl(constant('LANG')) ~ leaf.getSlug() %}
  {% if leaf.getStatus() == 1 %}
  <li class="{{helper.addActiveMenu(url)}}">
    <a href="{{ url }}">{{ leaf.getTitle() }}</a>
  </li>
  {% endif %}
{%- endmacro %}

{% for root, root_title in entries %}        
  {% if root == 'bottom' %}
  {% set url = helper.currentUrl(constant('LANG')) %}
  <ul class="flv_line_height_32 footer-menu"> 
    {% set menu = menu_helper.menuUpperLeafs(root) %}
      {% for leaf in menu %}
        {{ leaf_item(leaf, url.get()) }}
    {% endfor %}
  </ul>
  {% endif %}
{% endfor %}