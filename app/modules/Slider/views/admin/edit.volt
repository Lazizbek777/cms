<form method="post" action="" class="ui form" enctype="multipart/form-data">
    <div class="ui segment">
        <a href="{{ url.get() }}slider/admin/index" class="ui button">
            <i class="icon left arrow"></i> {{ helper.at('Back') }}
        </a>

        <div class="ui positive submit button">
            <i class="save icon"></i> {{ helper.at('Save') }}
        </div>

        {% if slider is defined %}
            <a href="{{ url.get() }}slider/admin/delete/{{ slider.getId() }}?lang={{ constant('LANG') }}" class="ui button red">
                <i class="icon trash"></i> {{ helper.at('Delete') }}
            </a>
        {% endif %}
    </div>
    
    <div class="ui segment">
        {{ form.renderDecorated('title') }}   
        {{ form.renderDecorated('text') }}
        {{ form.renderDecorated('banner') }}
        {{ form.renderDecorated('view_title') }}
    </div>
    
</form>

<script>
    $(".ui.form").form({
        fields: {
            title: {
                identifier: 'title',
                rules: [
                    {type: 'empty'}
                ]
            }
        }
    });
</script>