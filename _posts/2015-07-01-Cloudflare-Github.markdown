---
layout: post
title:  "Cloudflare + Github"
date:   2015-07-01 00:00:00
category: technical
tags: blog website jekyll github cloudflare
---

Configuring Cloudflare and GitHub to work together properly was not obvious to me from the documentation - this post is here mainly for my reference if I need to do this again.

I mean, there's a helpful post [here][codedge-blog-setup] about how to set up /blog/ via GitHub pages - it also explains why you can't just put a Jekyll site in a subfolder if you're hosting a site and a blog on GitHub.

...but I want a subdomain instead of a directory - that is, `blog.matthewcocco.com` instead of `matthewcocco.com/blog/`.

Consequently, working with the DNS and some minor repo magic is necessary - see below my config inside the Cloudflare control panel:

![the Cloudflare DNS configuration for matthewcocco.com][cloudflare-config]

...and the `CNAME` file in the `gh-pages` branch of [this blog's repository][blog-repo] is simply 

	blog.matthewcocco.com

so what's the process I used?

1. Set up (on GitHub) the personal repo (looks like `[username].github.com`) with the `CNAME` file inside that has your custom domain (looks like `example.com`).

2. Set up (on GitHub) the blog (or other) repo where you'll be putting the Jekyll installation and create a `gh-pages` branch. This repo will function as if it were serving project webpages, which is why a repo named *blog* will be found at `username.github.io/blog`. This repo should have a `CNAME` file inside containing the custom subdomain (looks like `blog.example.com`).

3. (insert content into home page and blog as appropriate, so that there's content to serve)

4. With whoever controls your DNS records, configure at least two CNAMEs (*example.com* and *blog.example.com*) to point to `username.github.io`. (consider also one for *www* to point to your root domain, so that it properly redirects.)

5. Give the DNS updates some time to propagate, and you should be good to go.


[codedge-blog-setup]:http://codedge.io/blog/github/jekyll/web/2015/05/06/setting-up-a-jekyll-blog-on-a-github-pages-subdirectory.html
[blog-repo]:https://github.com/matthewcocco/blog/tree/gh-pages

[cloudflare-config]:/assets/images/matthewcocco-dot-com-dns-records.png