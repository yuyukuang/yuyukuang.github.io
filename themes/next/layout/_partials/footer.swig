<script async src="https://dn-lbstatics.qbox.me/busuanzi/2.3/busuanzi.pure.mini.js"></script>
<div class="copyright" >
  {% set current = date(Date.now(), "YYYY") %}
  &copy; {% if theme.since and theme.since != current %} {{ theme.since }} - {% endif %}
  <span itemprop="copyrightYear">{{ current }}</span>
  <span class="with-love">
    <i class="fa fa-{{ theme.authoricon }}"></i>
  </span>
  <span class="author" itemprop="copyrightHolder">{{ config.author }}</span>
  <div class="theme-info">
  <div class="powered-by"></div>
  {{ __('footer.theme') }} -
  <a class="theme-link" href="https://github.com/yuyukuang" rel="external nofollow">
    Github
  </a>
  <div class="powered-by"></div>
  <span class="post-count">博客全站共{{ totalcount(site) }}字</span>
  </div>
</div>
