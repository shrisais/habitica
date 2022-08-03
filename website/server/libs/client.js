const ROOT = `${__dirname}/../../../`;

export function serveClient (expressRes) { // eslint-disable-line import/prefer-default-export
  return expressRes.sendFile('./website/client/public/index.html', { root: ROOT });
}
