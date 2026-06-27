import express, { Request, Response } from 'express';

const app = express();
const port = 3000;

app.get('/', (_req: Request, res: Response) => {
    res.json({ service: 'typescript-express', status: 'running' });
});

app.get('/health', (_req: Request, res: Response) => {
    res.json({ status: 'healthy' });
});

app.listen(port, '0.0.0.0', () => {
    console.log(`typescript-express listening on port ${port}`);
});
