function Logger () {
    const DEBUG = 'DEBUG'
    const INFO = 'INFO'
    const ERROR = 'ERROR'

    const logMessage = function (level, msg) {
        console.log('[' + level + '] - ' + msg)
    }

    return {
        debug: function (msg) {
            logMessage(DEBUG, msg)
        },
        info: function (msg) {
            logMessage(INFO, msg)
        },
        error: function (msg) {
            logMessage(ERROR, msg)
        }
    }
}
const log = Logger()

export {log}
