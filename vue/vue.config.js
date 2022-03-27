module.exports = {
    productionSourceMap: false,
    devServer: {
        proxy: {
            '/img': {
                target: 'https://iw233.cn',
                changeOrigin: true,
                https: true,
                pathRewrite: {
                    '^/img': ''
                },
                logLevel: "debug",
            }
        },
    },
    lintOnSave: false//关闭语法检查

}
// cli3.0需要手动创建vue.config.js文件