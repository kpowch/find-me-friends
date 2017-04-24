import React from 'react';
import ReactDOM from 'react-dom';
import Friend from './Friend'

class SuggestionList extends React.Component {

  render() {
    return (
      <main className="suggestion-list">
        {this.props.friends.map(function(friend) {
          return (<Friend name={friend}/>)
          }
        )}
      </main>
    );
  }
}

export default SuggestionList;