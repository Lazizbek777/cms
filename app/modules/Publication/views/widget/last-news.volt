{% if entries %}
  <h2>{{helper.translate('Last news')}}</h2>
  {% for item in entries %}
    {% set url = helper.langUrl([
    'for':'publication',
    'type':item.t_slug,
    'slug':item.p.getSlug()
    ]) %}
    {% set image = helper.image([
    'id':item.p.getId(),
    'type':'publication',
    'width': 200,
    'height': 150,
    'strategy': 'a'
    ],[
    'alt':item.title|escape_attr
    ]) %}
    <div class="col-sm-3">
      {% if image.isExists() %}
        <a href="{{ url }}" title="{{ item.title|escape_attr }}" class="thumbnail" rel="nofollow">
          {{ image.imageHTML() }}
        </a>
      {% endif %}
      <div class="content">
        <h3><a href="{{ url }}" title="{{ item.title|escape_attr }}" class="title">{{ item.title }}</a></h3>
        <div class="date">{{ item.p.getDate('d.m.Y') }}</div>
        <div class="announce">{{ helper.announce(item.text, 130) }}</div>
      </div>                    
    </div>
  {% endfor %}
{% endif %}