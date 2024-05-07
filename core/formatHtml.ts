export function formatHtml(sessionId: string): string {
  return `
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Wing Greeting Service</title>
    
        <!-- Tailwind CSS Play CDN https://tailwindcss.com/docs/installation/play-cdn -->
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="flex items-center justify-center h-screen">
        <div class="text-center", id="greeting">
            <h1 class="text-2xl font-bold">Session ID: ${sessionId}</h1>
        </div>
    </body>
    </html>
    `;
}
