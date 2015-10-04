run Proc.new { |env|
  url = 'http://s3.amazonaws.com/walfie/i' + env['PATH_INFO']
  if env['HTTP_USER_AGENT'].downcase.include? 'twitterbot'
    html = %Q{
    <html>
    <head>
    <title>#{env['PATH_INFO'].split('/').last}</title>
    <meta name="twitter:card" content="summary_large_image">
    <meta name="twitter:site" content="@walfieee">
    <meta name="twitter:title" content="#{env['PATH_INFO']}">
    <meta name="twitter:description" content="#{url}">
    <meta name="twitter:image" content="#{url}">
    </head>

    <body>
    <img src="#{url}"/>
    </body>
    </html>
    }
    [200, {'Content-Type' => 'text/html'}, StringIO.new(html)]
  else
    [302, {'Location' => url}, StringIO.new(url)]
  end
}

