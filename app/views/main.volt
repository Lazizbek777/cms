<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title> {{ helper.title().get()|escape }} </title>
    {{ helper.meta().get('description') }}
    {{ helper.meta().getOG('type') }}
    {{ helper.meta().getOG('site_name') }}
    {{ helper.meta().getOG('url') }}
    {{ helper.meta().getOG('title') }}
    {{ helper.meta().getOG('description') }}
    {{ helper.meta().getOG('image') }}
    {{ helper.meta().get('robots') }}

    <link href="/{{ helper.favicon() }}" rel="shortcut icon" type="image/vnd.microsoft.icon">    

    <!--css libs-->
    <link href="/vendor/font-awesome-4.2.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="/vendor/fancybox/css/fancybox.css" rel="stylesheet" type="text/css" media="screen" />
    <link href="/assets/admin/css/global.css" rel="stylesheet" type="text/css" />
    <link href="/assets/css/style.css" rel="stylesheet" type="text/css"> 
    <link href="/assets/css/mobile.css" rel="stylesheet" type="text/css">
    <!--/css libs-->  

    <script src="/vendor/js/jquery-1.11.0.min.js"></script>
    <script src="/assets/js/bootstrap.min.js"></script>
    <script src="/assets/js/form.min.js"></script>
    <script src="/assets/js/jquery.cookie.js"></script>
    <script type="text/javascript" src="/vendor/fancybox/js/fancybox.js"></script>
    
    <script src="/assets/js/main.js"></script>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="/vendor/js/html5shiv.js"></script>
    <script src="/vendor/js/respond.min.js"></script>
    <![endif]-->

    <!--js-->
    {{ assets.outputJs('js') }}
    <!--/js-->

    {{ helper.javascript('head') }}

</head>
<body{% if view.bodyClass %} class="{{ view.bodyClass }}"{% endif %}>
  <div id="wrapper" class="section">
    {{ content() }}    
  </div>
</body>
</html>