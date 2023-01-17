{% macro no_digits_in_columns() %}
    {% set columns = adapter.get_columns_in_relation(this) %}
    {% for column in columns %}
        {% if column.name not in ['id', 'created_at', 'updated_at'] %}
            {% if column.data_type not in ['varchar', 'text'] %}
                {% if column.data_type not in ['integer', 'float', 'numeric'] %}
                    {% do exceptions.raise_compiler_error("Column " ~ column.name ~ " is not a varchar, text, integer, float, or numeric.") %}
                {% endif %}
            {% endif %}
        {% endif %}
    {% endfor %}
{% endmacro %}