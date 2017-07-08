<div class="pagination">
    <span class="step-links">
        {% if posts.has_previous() %}
            <a href="?page={{ posts.previous_page_number() }}">previous</a>
        {% endif %}

        <span class="current">
            Page {{ posts.number }} of {{ posts.paginator.num_pages }}.
        </span>

        {% if posts.has_next() %}
            <a href="?page={{ posts.next_page_number() }}">next</a>
        {% endif %}
    </span>
</div>