Pod::Spec.new do |s|
  s.name = 'DataSnapshotDecoder'
  s.version = '1.0'
  s.license = 'MIT'
  s.summary = "Use Swift's Decodable with Firebase Realtime Database"
  s.homepage = 'https://github.com/MindSea/DataSnapshotDecoder'
  s.authors = { 'MindSea Development Inc.' => 'hello@mindsea.com' }
  s.source = { :git => 'https://github.com/MindSea/DataSnapshotDecoder.git', :tag => s.version }
    
  s.ios.deployment_target = '8.0'
  s.static_framework = true
  s.swift_version = '4.0'
  
  s.dependency 'FirebaseDatabase', '~> 4.0'
  s.source_files = 'DataSnapshotDecoder.swift'
end
