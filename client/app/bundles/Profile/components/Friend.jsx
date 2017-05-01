import React from 'react';
import ReactDOM from 'react-dom';

class Friend extends React.Component {

  render() {
    console.log('Friend this.props', this.props)
    const friend = this.props.friend;
    return (
      <div className="friend">
        <a className="remove-filter" onClick={this.props.onAccept}>ACCEPT</a><br/><br/>
        <a className="remove-filter" onClick={this.props.onRemove}>REMOVE</a><br/>
        <div className="card-name">
          {friend.first_name}
        </div>
        <div className="card-name">
          {friend.last_name}
        </div>
        <img className="card-pic" src={friend.profile_picture.thumb.url}/>
        <div className="card-email">
          {friend.email}
        </div>
      </div>
    );
  }
}

export default Friend;
