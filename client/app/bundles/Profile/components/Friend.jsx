import React from 'react';
import ReactDOM from 'react-dom';
import InterestMatchChart from './InterestMatchChart';

export default class Friend extends React.Component {

  render() {
    // this makes the code more readable
    const { friend, addSuggestedFriend, declineSuggestedFriend } = this.props;

    return (
      <div className='friend'>
        <div className='name-container'>
          <div className='card-name-container'>
            <img className='card-pic' src={friend.profile_picture}/>
            <div className='name-email'>
              <div className='card-name'>
                {friend.first_name} {friend.last_name}
              </div>
              <div className='card-email'>
                {friend.email}
              </div>
            </div>
          </div>
            <div className='card-bio'>
               {friend.bio}
            </div>
          </div>

        <div className='profile-column'>
          <div className='card-percent'>
            <InterestMatchChart match={Math.round(friend.friendship_match * 100)} />
          </div>
          <div className='friend-buttons'>
            <div className='add-friend'>
              <a className='form-button' onClick={addSuggestedFriend(friend)}>Add Friend</a>
            </div>
            <div className='skip-friend'>
              <a className='button' onClick={declineSuggestedFriend(friend)}>Skip >></a>
            </div>
          </div>
        </div>
      </div>
    );
  }
}
