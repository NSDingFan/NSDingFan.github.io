{% if page.comments && theme.gitalk.enable %}
  <link rel="stylesheet" href="https://unpkg.com/gitalk/dist/gitalk.css">

  <script src="https://unpkg.com/gitalk/dist/gitalk.min.js"></script>

  <script type="text/javascript">
      const gitalk = new Gitalk({
        clientID: '{{ theme.gitalk.ClientID }}',
        clientSecret: '{{ theme.gitalk.ClientSecret }}',
        repo: '{{ theme.gitalk.repo }}',
        owner: '{{ theme.gitalk.githubID }}',
        admin: ['{{ theme.gitalk.adminUser }}'],
        id: decodeURIComponent(location.pathname),
        labels: '{{ theme.gitalk.labels }}'.split(',').filter(l => l),
        perPage: {{ theme.gitalk.perPage }},
        pagerDirection: '{{ theme.gitalk.pagerDirection }}',
        createIssueManually: {{ theme.gitalk.createIssueManually }},
        distractionFreeMode: '{{ theme.gitalk.distractionFreeMode }}'
      })

      gitalk.render('gitalk-container');          
  </script>
{% endif %}