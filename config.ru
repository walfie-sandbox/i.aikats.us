run Proc.new { |env|
  url = 'http://s3.amazonaws.com/walfie-images' + env['PATH_INFO']
  if env['HTTP_USER_AGENT'].downcase.include? 'twitterbot'
    html = %Q{
    <html>
    <head>
    <title>#{env['PATH_INFO'].split('/').last}</title>
    <meta name="twitter:card" content="photo">
    <meta name="twitter:title" content="">
    <meta name="twitter:site" content="@walfieee">
    <meta name="twitter:image:src" content="#{url}">
    <meta name="twitter:app:url:iphone" content="">
    <meta name="twitter:app:url:ipad" content="">
    <meta name="twitter:app:url:googleplay" content="">
    <meta name="twitter:app:id:iphone" content="">
    <meta name="twitter:app:id:ipad" content="">
    <meta name="twitter:app:id:googleplay" content="">
    </head>

    <body>
    <img src="#{url}"/>
    </body>
    }
    [200, {'Content-Type' => 'text/html'}, StringIO.new(html)]
  else
    [301, {'Location' => url}, StringIO.new(url)]
  end
}

