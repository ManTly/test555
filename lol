const Discord = require("discord.js")

const bot = new Discord.Client();

const token = ('NTY4OTI2ODc4Nzk5NDk1MTgw.XLpiAw.uOrvZSv1kIHej8NJC3C6IJ5S3kk');

const PREFIX = '!';

const attachment = ('https://i.imgur.com/w3duR07.png');

const versie = '1.0.1';

bot.on('message', message =>{
    if (message.content === '!rip') {
        message.channel.send(attachment);
    }
});


bot.on('ready', () => {
    console.log('De bot is online!');
})

bot.on('guildMemberAdd', member =>{

    const channel = member.guild.channels.find(channel => channel.name === "general");
    if(!channel) return;

    channel.send(`Welkom op de server ${member}!`)

});



bot.on('message', message=>{

    let args = message.content.substring(PREFIX.length).split(" ");

    switch(args[0]){
        case 'userinfo':
            const embed = new Discord.RichEmbed() 
            .setTitle('Informatie') 
            .addField('Naam', message.author.username)
            .addField('Versie', versie)
            .addField('Server', message.guild.name) 
            .setColor(0x48C9B0)
            .setThumbnail(message.author.avatarURL)
            .setFooter('Groeten Test Bot!')
            message.channel.sendEmbed(embed);
        break;
            
    }
})

bot.on('message', message=>{

    let args = message.content.substring(PREFIX.length).split(" ");

    switch(args[0]){
        case 'commands':
            const embed = new Discord.RichEmbed() 
            .setTitle('***Al de commands***') 
            .addField('!userinfo', "__Je informatie__")
            .addField('!rip', "__Grotere RIP__")
            .setColor(0xF8C471)
            .setFooter('Groeten Test Bot!')
            message.channel.sendEmbed(embed);
        break;
            
    }
})

bot.login(token);
