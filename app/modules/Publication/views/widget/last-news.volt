{% if entries %}
  <div class="blog-post-area">
    <h2 class="title text-center">{{ helper.translate('Latest news')}}</h2>
    {% for item in entries %}
      {% set url = helper.langUrl([
      'for':'publication',
      'type':item.t_slug,
      'slug':item.p.getSlug()
      ]) %}
      {% set image = helper.image([
      'id':item.p.getId(),
      'type':'publication',
      'width': 600,
      'height': 200,
      'strategy': 'w'
      ],[
      'alt':item.title|escape_attr
      ]) %}
      <div class="single-blog-post">
        <h3>{{ item.title }}</h3>
        <div class="post-meta">
          <ul>
            <li><i class="fa fa-user"></i> Mac Doe</li>
            <li><i class="fa fa-clock-o"></i> {{ item.p.getDate('h:i:s') }}</li>
            <li><i class="fa fa-calendar"></i> {{ item.p.getDate('d.m.Y') }}</li>
          </ul>
          <span>
            <i class="fa fa-star"></i>
            <i class="fa fa-star"></i>
            <i class="fa fa-star"></i>
            <i class="fa fa-star"></i>
            <i class="fa fa-star-half-o"></i>
          </span>
        </div>
        <a href="{{ url }}" title="{{ item.title|escape_attr }}" class="image" rel="nofollow">
          {% if image.isExists() %}
            {{ image.imageHTML() }}
          {% endif %}
        </a>
        <p>{{ helper.announce(item.text, 250) }}</p>
        <a  class="btn btn-primary" href="{{ url }}">{{ helper.translate('Read More')}}</a>
      </div>
    {% endfor %}

  </div>
{% endif %}