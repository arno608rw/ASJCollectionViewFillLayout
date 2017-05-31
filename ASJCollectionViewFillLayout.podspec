Pod::Spec.new do |s|
  s.name          = 'ASJCollectionViewFillLayout'
  s.version       = '2.1'
  s.platform	    = :ios, '7.0'
  s.license       = { :type => 'MIT' }
  s.homepage      = 'https://github.com/arno608rw/ASJCollectionViewFillLayout'
  s.authors       = { 'Sudeep Jaiswal' => 'sudeepjaiswal87@gmail.com', 'Thitipong W' => 'arno608rw@gmail.com' }
  s.summary       = 'Modify ASJCollectionViewFillLayout : A flow layout style UICollectionViewLayout that fills the full width of the collection view'
  s.source        = { :git => 'https://github.com/arno608rw/ASJCollectionViewFillLayout.git', :tag => s.version }
  s.source_files  = 'ASJCollectionViewFillLayout/*.{h,m}'
  s.requires_arc  = true
end
