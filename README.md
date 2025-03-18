# folder structure & features
├── public 
└── src 
    ├── api -- api calls
    ├── assets -- images, icons, etc.
    ├── components -- reusable components
    │   ├── arena
    │   ├── bookcase
    │   ├── calendar
    │   ├── common
    │   │   └── auth -- auth related
    │   ├── map
    │   └── quest
    ├── configs -- config files
    ├── hooks -- custom hooks
    ├── layouts -- layout components
    ├── lib -- utility functions
    ├── pages -- page components
    ├── services -- service functions
    ├── states -- state management
    ├── styles -- global styles
    ├── types -- type definitions
    └── utils -- utility functions

# run the app Port dev : 5173
npm run dev

# docker build & push tag manage
docker build -t lyckabc.xyz/registry/gopediafe:dev .
docker push lyckabc.xyz/registry/gopediafe:dev

# nohup tip
nohup npm run dev &
# if you want to terminate nohup PID 79114
lsof -i :3000
kill -9 79114
lsof -i :3000