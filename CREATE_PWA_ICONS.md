# Como Criar os Ícones do PWA

Para criar os ícones do PWA, você precisa de uma imagem quadrada (recomendado 512x512px) com o logo do PilotStudy.

## Opção 1: Usar um gerador online
1. Acesse: https://www.pwabuilder.com/imageGenerator
2. Faça upload de uma imagem do logo (512x512px)
3. Baixe os ícones gerados
4. Coloque os arquivos `icon-192.png` e `icon-512.png` na pasta `client/public/`

## Opção 2: Criar manualmente
1. Crie uma imagem 512x512px com:
   - Fundo azul (#3b82f6)
   - Ícone de avião branco no centro
   - Texto "PilotStudy" (opcional)

2. Redimensione para 192x192px para criar o segundo ícone

3. Salve como:
   - `client/public/icon-192.png`
   - `client/public/icon-512.png`

## Opção 3: Usar um ícone temporário
Por enquanto, você pode usar um ícone de placeholder:
1. Crie um arquivo SVG simples
2. Converta para PNG usando um conversor online
3. Salve nas dimensões corretas

## Recomendação de Design
- Fundo: Azul (#3b82f6) - cor tema do app
- Ícone: Avião branco ou símbolo de aviação
- Estilo: Minimalista, moderno
- Bordas: Arredondadas (o iOS faz isso automaticamente)
