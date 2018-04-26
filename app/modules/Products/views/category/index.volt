<!--controls-->
<div class="ui segment">

    <a href="{{ url.get() }}products/admin?lang={{ constant('LANG') }}" class="ui button">
        <i class="icon left arrow"></i> {{helper.at('Products')}}
    </a>

    <a href="{{ url.get() }}products/category/add" class="ui button positive">
        <i class="icon plus"></i> {{helper.at('Add New')}}
    </a>

</div>
<!--/end controls-->

<table class="ui table very compact celled">
    <thead>
    <tr>
        <th style="width: 100px"></th>
        <th>{{helper.at('Title')}}</th>
        <th>URL</th>        
    </tr>
    </thead>
    <tbody>
    {% for item in entries %}
        {% if item['child'] %}
        {% set link = url.get() ~ "products/category/edit/" ~ item['id'] %}
        <tr>
            <td><a href="{{ link }}?lang={{ constant('LANG') }}" class="mini ui icon button"><i class="icon edit"></i>
                    id = {{ item['id'] }}</a></td>
            <td>
                <a href="{{ link }}?lang={{ constant('LANG') }}">{{ item['title'] }}</a>
                <ol>                    
                    {% for children in item['child'] %}
                        {% set child_cat_link = helper.langUrl(['for':'products', 'category': children['slug']]) %}
                        {% set child_ad_link = url.get() ~ "products/category/edit/" ~ children['id'] %}
                        <li><a href="{{ child_ad_link }}">{{ children['title'] }}</a> (<a href="{{child_cat_link}}" target="_blank">{{child_cat_link}}</a>) </li>
                    {% endfor %}
                </ol> 
            </td>
            
            {% set prod_link = helper.langUrl(['for':'products', 'category': item['slug']]) %}
            <td><a href="{{ prod_link }}" target="_blank">{{ prod_link }}</a></td>            
        </tr>
        {% endif %}
        {% if !item['child'] %}
        {% set link = url.get() ~ "products/category/edit/" ~ item['id'] %}
        <tr>
            <td><a href="{{ link }}?lang={{ constant('LANG') }}" class="mini ui icon button"><i class="icon edit"></i>
                    id = {{ item['id'] }}</a></td>
            <td>
                <a href="{{ link }}?lang={{ constant('LANG') }}">{{ item['title'] }}</a>                
            </td>
            
            {% set prod_link = helper.langUrl(['for':'products', 'category': item['slug']]) %}
            <td><a href="{{ prod_link }}" target="_blank">{{ prod_link }}</a></td>            
        </tr>
        {% endif %}
    {% endfor %}
    </tbody>
</table>
