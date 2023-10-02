# Pin npm packages by running ./bin/importmap

pin 'application', preload: true
pin_all_from 'app/javascript/controllers', under: 'controllers'

pin '@hotwired/turbo-rails', to: 'turbo.min.js', preload: true
pin '@hotwired/stimulus', to: 'stimulus.min.js', preload: true
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js', preload: true

pin '@editorjs/editorjs', to: '@editorjs--editorjs.js' # @2.28.0
pin '@editorjs/list', to: '@editorjs--list.js' # @1.8.0
pin '@editorjs/quote', to: '@editorjs--quote.js' # @2.5.0
pin '@editorjs/nested-list', to: '@editorjs--nested-list.js' # @1.3.0
pin '@editorjs/underline', to: '@editorjs--underline.js' # @1.1.0
pin '@editorjs/table', to: '@editorjs--table.js' # @2.2.2
pin '@editorjs/inline-code', to: '@editorjs--inline-code.js' # @1.4.0
pin '@editorjs/header', to: '@editorjs--header.js' # @2.7.0
pin '@editorjs/image', to: '@editorjs--image.js' # @2.8.1
pin "@editorjs/code", to: "@editorjs--code.js" # @2.8.0
pin "@editorjs/embed", to: "@editorjs--embed.js" # @2.5.3
