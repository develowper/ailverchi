const http = require('http');
var fs = require('fs');
const hostname = '127.0.0.1';
const port = process.env.PORT ?? 1126;
const server = http.createServer((req, res) => {
    fs.readFile('./public/hello.html', function (error, content) {
        if (error) {
            console.log(error)
            res.writeHead(500);
            res.end();
        } else {
            res.writeHead(200, {'Content-Type': 'text/html'});
            res.end(content, 'utf-8');
        }
    });
});
server.listen(port, hostname, () => {
    console.log(`Server running at http://${hostname}:${port}/`);
});
