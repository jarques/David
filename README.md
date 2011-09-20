<h1>david - An (extremely) basic URL shortener built on Goliath </h1>
David is small proof of concept of a short url service built using Goliath and Redis.

<h2>Installation</h2>
David requires Goliath and Redis.

To get Goliath up and running, install Ruby 1.9.2:

<pre>
$> gem install rvm
$> rvm install 1.9.2
$> rvm use 1.9.2
</pre>

Install Goliath:

<pre>
$> gem install goliath
</pre>

I use Homebrew, so to install redis using homebrew:

<pre>
$> brew install redis
$> gem install redis
</pre>

<h2>Running David</h2>
Make sure your redis server is running, to get david up and running simply run the following in the directory:

<pre>
$> ruby david.rb -sv
</pre>

You can set environment variables as well as deamonizing the server.

<pre>
$> ruby david.rb -d -eprod
</pre>

<h2>Some notes</h2>
As of this writing, David is still pretty dumb. I currently haven't added a way to add new URLs nor track clicks. A proper redirecting should be in place, too.

You can follow me on twitter: http://twitter.com/jarques