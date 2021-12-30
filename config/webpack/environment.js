const {environment} = require ('@rails/webpack')
const webpack = require ('webpack')

environment.plugins.append('provide',new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Rails: '@rails/ujs'
  }))
  module.exports =environment
  