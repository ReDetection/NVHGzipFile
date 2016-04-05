Pod::Spec.new do |s|
  s.name             = "NVHGzipFile"
  s.version          = "1.1.0"
  s.summary          = "Just a simple Gzip handling for iOS6+"
  s.description      = <<-DESC
                      Unpack and pack gzipped files with ease. Features:
                       * Low memory footprint
                       * Asynchronous and synchronous and API's
                       DESC
  s.homepage         = "https://github.com/ReDetection/NVHGzipFile"
  s.license          = 'MIT'
  s.author           = { "Niels van Hoorn" => "nvh@nvh.io" }
  s.source           = { :git => "https://github.com/ReDetection/NVHGzipFile.git", :tag => s.version.to_s }

  s.platform     = :ios, '6.0'
  s.ios.deployment_target = '6.0'
  s.requires_arc = true

  s.source_files = 'Classes/*'

  s.library = 'z'

end
