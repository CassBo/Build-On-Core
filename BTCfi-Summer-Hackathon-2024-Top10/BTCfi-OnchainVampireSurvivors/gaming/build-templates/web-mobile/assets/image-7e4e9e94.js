const A="data:image/webp;base64,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";export{A as default};
