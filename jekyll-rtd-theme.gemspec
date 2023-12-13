Gem::Specification.new do |spec|
  spec.name          = "ABPO"
  spec.version       = "1.0.0"
  spec.authors       = ["JH Kim"]
  spec.email         = ["jh.kim@namutech.co.kr"]

  spec.summary       = "Automated Baremetal Provisioning Documentation with GitHub Pages"
  spec.license       = "MIT"
  spec.homepage      = "https://namuict.github.io/abp/"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r!^(assets|_layouts|_includes|_sass|LICENSE|README)!i) }

  spec.add_runtime_dependency "github-pages", "~> 209"
end
