{% macro status_label(status) -%}
    {% if status == 'code works' %}
        <span class="label label-success">code works</span>
    {% endif %}

    {% if status == 'code compiles'%}
        <span class="label label-warning">code compiles</span>
    {% endif %}

    {% if status == 'code fail'%}
        <span class="label label-danger">code fail</span>
    {% endif %}
{%- endmacro %}