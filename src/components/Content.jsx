const Content = ({ quests, setQuests }) => {
  return (
    <>
      <div className='content w-96 h-96 bg-neutral-800/50 rounded rounded-lg overflow-hidden shadow-lg'>
        <h1 className='header text-center font-bold text-white bg-neutral-800/70'>QUEST SYSTEM</h1>
        {quests.map(quest => (
          <p>{quest.name}</p>
        ))}
      </div>
    </>
  );
};

export default Content;
