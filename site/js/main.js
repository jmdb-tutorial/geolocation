import {log} from './logging.js'

function success(position) {
    const latitude = position.coords.latitude
    const longitude = position.coords.longitude

    log.info('You are located at Lat, Long (' + latitude + ', ' + longitude + ')')
}

function error() {
    log.error('Could not retrieve location')
}
function calculateGeoCode() {
    log.info('Calculating geocode...')

    if (!navigator.geolocation) {
        log.error("Browser Does Not Support geolocation")
    } else {
        navigator.geolocation.getCurrentPosition(success, error , {enableHighAccuracy: true})
    }
}

export { calculateGeoCode }
