#!/usr/bin/env zx

/**
  usage:
  -a, --app: ctq, ern, ua (default all apps)
  -p, --platform: android, ios (default both platforms)
  -t, --type: build, distribute (default build)
  -r, --release: release number (6.18.0 for example)

  npx zx ./appcenter-open.mjs -a ctq,ern -p android,ios -t build # to open build page for ctq and ern for android and ios
  npx zc ./appcenter-open.mjs # open build for all apps, for both platforms
 */

// alias aco="npx zx /Users/daymannovaes/workspace/clarity4/apps/clarity/build-scripts-helpers/appcenter-open.mjs"

const BASE_URL = 'https://appcenter.ms/orgs/Mindsciences/apps';

const APPS_URL = {
    ctq: {
        android: 'Craving-To-Quit-1',
        ios: 'Craving-To-Quit'
    },
    ern: {
        android: 'Eat-Right-Now-1',
        ios: 'Eat-Right-Now'
    },
    ua: {
        android: 'Unwinding-Anxiety',
        ios: 'Clarity-UA'
    }
};

let BUILD_URL = 'build/branches';
const RELEASE_BUILD_URL = (release) => `release%2F${release}`;
const DISTRIBUTE_ANDROID_URL = 'distribute/distribution-stores/Alpha/releases';
const DISTRIBUTE_IOS_URL = 'distribute/distribution-stores/App%20Store%20Connect%20Users/releases';


let appsToOpen = argv.a || argv.app;
appsToOpen = appsToOpen ? appsToOpen.toLowerCase().split(',') : Object.keys(APPS_URL);

let platformsToOpen = argv.p || argv.platform;
platformsToOpen = platformsToOpen ? platformsToOpen.toLowerCase().split(',') : ['android', 'ios'];

let type = argv._[0] || argv.t || argv.type || 'build';
type = type.toLowerCase();

let release = argv.r || argv.release;
if (release) {
  type = 'build';
  BUILD_URL = `${BUILD_URL}/${RELEASE_BUILD_URL(release)}`;
}

// create urls
let urls = [];
platformsToOpen.forEach(platform => {
  appsToOpen.forEach(app => {
    let url = `${BASE_URL}/${APPS_URL[app][platform]}`;
    switch (type) {
      case 'build':
        url += `/${BUILD_URL}`;
        break;
      case 'distribute':
        url += `/${platform === 'android' ? DISTRIBUTE_ANDROID_URL : DISTRIBUTE_IOS_URL}`;
        break;
      default:
        throw new Error(`Unknown type: ${type}`);
    }
    urls.push(url);
  });
});

await $`open -na "Google Chrome" --args --new-window ${urls}`
