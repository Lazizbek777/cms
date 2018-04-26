<section class="section banner-inner">
    <article class="container">
    	<h1 class="page-title">{{ title }}</h1>
    </article>
</section>

<section class="section main-content">
	<article class="container">
		{{helper.widget('Breadcrumbs').breadcrumbs()}}
  	<div class="full-text">
  		{% for item in entries %}
        <form action="/poll/vote" method="post">
          <input type="hidden" name="poll_id" value="{{item.getId()}}">
          {{ item.getTitle() }}
          {% for field in item.options %}
            <div class="radio">
              <input type="radio" name="vote" id="vote_{{field.getId()}}" value="{{field.getVote()}}">
              <label for="vote_{{field.getId()}}">{{field.getTitle()}}</label>
            </div>
          {% endfor %}
          <div class="form-actions">
            <input class="btn btn-primary" type="submit" value="{{helper.translate('Vote')}}">
          </div>
        </form>
	    {% endfor %}
  	</div>
	</article>
</section>