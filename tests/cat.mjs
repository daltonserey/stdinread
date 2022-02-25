import { readline, done } from 'stdinread';

while (true) {
    let line = await readline();
    if (line == null) break;
    console.log(line);
}

done();
