# 自動再読み込み
activate :livereload

# ベンダープリフィックス付与
activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

# Layouts
set :layout, 'site'
page 'index.html', layout: 'top'

# Build-specific configuration
configure :build do
  # HTML 圧縮
  activate :minify_html

  # CSS 圧縮
  activate :minify_css

  # JavaScript 圧縮
  activate :minify_javascript

  # イメージの圧縮
  activate :imageoptim do |options|
    # Use a build manifest to prevent re-compressing images between builds
    options.manifest = true
    # Silence problematic image_optim workers
    options.skip_missing_workers = true
    # Cause image_optim to be in shouty-mode
    options.verbose = false
    # Setting these to true or nil will let options determine them (recommended)
    options.nice = true
    options.threads = true
    # Image extensions to attempt to compress
    options.image_extensions = %w(.png .jpg .gif .svg)
    # Compressor worker options, individual optimisers can be disabled by passing
    # false instead of a hash
    options.advpng    = { :level => 4 }
    options.gifsicle  = { :interlace => false }
    options.jpegoptim = { :strip => ['all'], :max_quality => 100 }
    options.jpegtran  = { :copy_chunks => false, :progressive => true, :jpegrescan => true }
    options.optipng   = { :level => 6, :interlace => false }
    options.pngcrush  = { :chunks => ['alla'], :fix => false, :brute => false }
    options.pngout    = { :copy_chunks => false, :strategy => 0 }
    options.svgo      = {}
  end

  # アセットファイルの URL にハッシュを追加
  # activate :asset_hash
end
